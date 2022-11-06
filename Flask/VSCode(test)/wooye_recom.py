# pip install PyMySQL
from urllib import request
from flask import Flask #간단히 플라스크 서버를 만든다

from sklearn.metrics.pairwise import cosine_similarity
from sklearn.feature_extraction.text import CountVectorizer
# import sys
import pymysql
import pandas as pd
import numpy as np
import warnings; warnings.filterwarnings('ignore')
from sklearn.metrics import mean_squared_error
from sklearn.metrics.pairwise import cosine_similarity

import copy

db = pymysql.connect(host='wooyeweb-db.ciltk7evuwgz.us-east-1.rds.amazonaws.com', port=3306, 
  user='WooyeAdmin', password='wooyeadmin_admin', db='wooyedb', charset='utf8')
cursor = db.cursor()
cursor_grade = db.cursor() 
cursor_masterpiece = db.cursor()
cursor_content = db.cursor()
cursor_cn = db.cursor()
cursor_user = db.cursor()

# 4단계 : sql문 작성(데이터 read)
sql = "SELECT * FROM classic"
sql_grade = "SELECT * FROM grade"
sql_masterpiece = "SELECT * FROM masterpiece"
sql_content = "SELECT * FROM my_classic"
sql_cn = "SELECT * FROM my_art"
sql_user = "SELECT * FROM test_id"

# 5단계 : sql문 실행(데이터 read)
cursor.execute(sql)
cursor_grade.execute(sql_grade)
cursor_masterpiece.execute(sql_masterpiece)
cursor_content.execute(sql_content)
cursor_cn.execute(sql_cn)
cursor_user.execute(sql_user)

# 6단계 : fetch 메서드(조회결과 콘솔창에서 보기 위함)
result = cursor.fetchall()  # fetchall() : 전부 가져오기
result_grade = cursor_grade.fetchall()
result_masterpiece = cursor_masterpiece.fetchall()
result_content = cursor_content.fetchall()
result_cn = cursor_cn.fetchall()
result_user = cursor_user.fetchall()

# 7단계 : 실행 결과 콘솔창에서 출력
classic = pd.DataFrame(
    columns=['seq', 'title', 'composer', 'musical_form', 'year', 'era'])
for data in result:
    classic = classic.append(pd.DataFrame([data], columns=[
                             'seq', 'title', 'composer', 'musical_form', 'year', 'era']), ignore_index=True)

grade = pd.DataFrame(columns=['grade_seq','user_id','masterpiece_seq','grade_score'])
masterpiece = pd.DataFrame(columns=['masterpiece_seq','masterpiece_title','masterpiece_artist', 'masterpiece_era','masterpiece_year','masterpiece_technique','masterpiece_material'])
content = pd.DataFrame(columns=['seq','id','title'])
cn = pd.DataFrame(columns=['seq','id','title'])
user = pd.DataFrame(columns=['id'])

for data1 in result_grade:
   grade = grade.append(pd.DataFrame([data1], columns=['grade_seq','user_id','masterpiece_seq','grade_score']), ignore_index=True)

for data2 in result_masterpiece:
   masterpiece = masterpiece.append(pd.DataFrame([data2], columns=['masterpiece_seq','masterpiece_title','masterpiece_artist', 'masterpiece_era','masterpiece_year','masterpiece_technique','masterpiece_material']), ignore_index=True)

for data3 in result_content:
   content = content.append(pd.DataFrame([data3], columns=['seq','id','title']), ignore_index=True)

for data4 in result_cn:
  cn = cn.append(pd.DataFrame([data4], columns=['seq','id','title']), ignore_index=True)

for data5 in result_user:
  user = user.append(pd.DataFrame([data5], columns=['id']), ignore_index=True)

# 8단계 : commit 및 연결 해제
db.commit()  # 커밋은 반복할 필요 없음
db.close()


# user 가져오기
user_id = user['id'][0]

# 콘텐츠 기반 추천 시스템 : user 한 명 걸로 클래식DB title 뽑아오기
content_user = content[content['id'] == user_id]
content_list = content_user['title'].values.tolist()

# 협업 기반 추천 시스템 - 최근접 이웃 협업 필터링 : (user 한 명 걸로) 명화DB title 뽑아오기
cn_user = cn[cn['id'] == user_id]
cn_list = cn_user['title'].values.tolist()


# wooye_content.py
df_classic = classic[['title', 'composer', 'musical_form', 'era']]

# 장르 벡터화
countrt_vector_form = CountVectorizer(min_df=0, ngram_range=(1, 2))
countrt_vector_composer = CountVectorizer(min_df=0, ngram_range=(2, 4))

c_vector_classic_era = countrt_vector_form.fit_transform(df_classic['era'])
c_vector_classic_composer = countrt_vector_composer.fit_transform(df_classic['composer'])

# 유사도 값 추출 (코사인 유사도)
similarity_classic_era = cosine_similarity(c_vector_classic_era, c_vector_classic_era)
similarity_classic_composer = cosine_similarity(c_vector_classic_composer, c_vector_classic_composer)
similarity_classic_et = np.dot(similarity_classic_era, similarity_classic_composer)

def recommend_classic_list(df, sim_matrix1, sim_matrix2, title, top=10):
    # 특정 클래식 정보 뽑아내기
    target_classic_index = df[df['title'] == title].index.values

    # 타겟 클래식과 비슷한 코사인 유사도 값
    df["similarity1"] = sim_matrix1[target_classic_index,:].reshape(-1, 1)  # 작가
    df["similarity2"] = sim_matrix2[target_classic_index,:].reshape(-1, 1)  # 폼

    sim_index = df.sort_values(
        by=["similarity1", 'similarity2'], ascending=False)

    # 본인 제외
    sim_index = sim_index[sim_index.index.values != target_classic_index]

    # 유사도 내림차순 정렬 후 상위 index 추출
    final_index = sim_index.index.values[: top]
    final_index = df.iloc[final_index].drop(
        ['similarity1', 'similarity2'], axis=1)

    return final_index



# wooye_cn.py
df_masterpiece = masterpiece[['masterpiece_title', 'masterpiece_artist', 'masterpiece_era', 'masterpiece_year', 'masterpiece_technique', 'masterpiece_material']]
df_grade = grade[['user_id', 'masterpiece_seq', 'grade_score']]
df_masterpiece = df_masterpiece.astype({'masterpiece_year':'object'})

df_masterpiece_test = masterpiece[['masterpiece_seq', 'masterpiece_title', 'masterpiece_artist', 'masterpiece_era', 'masterpiece_year', 'masterpiece_technique', 'masterpiece_material']]
df_masterpiece = masterpiece[['masterpiece_seq', 'masterpiece_title', 'masterpiece_artist', 'masterpiece_era', 'masterpiece_year', 'masterpiece_technique', 'masterpiece_material']]

df_grade_test = grade[['user_id', 'masterpiece_seq', 'grade_score']]

potential_user_masterpiece_score = pd.merge(df_masterpiece_test, df_grade_test, on="masterpiece_seq")

user_masterpiece_matrix = potential_user_masterpiece_score.pivot_table('grade_score', index='user_id', columns='masterpiece_seq')
user_masterpiece_matrix = potential_user_masterpiece_score.pivot_table('grade_score', index='user_id', columns='masterpiece_title')
user_masterpiece_matrix = user_masterpiece_matrix.fillna(0)

# masterpiece 데이터와 grade 데이터를 merge 함수를 이용하여 합침
user_masterpiece_score = pd.merge(df_masterpiece, df_grade, on="masterpiece_seq")
# 실행 전 (무조건) 전 코드 실행하기
masterpiece_user_score = user_masterpiece_score.pivot_table('grade_score', index='masterpiece_title', columns='user_id')
user_masterpiece_score = user_masterpiece_score.pivot_table('grade_score', index='user_id', columns='masterpiece_title')

masterpiece_user_score.fillna(0, inplace=True)

def get_rmse(R, P, Q, non_zeros):
  error = 0
  # 두개의 분해된 행렬 P와 Q.T의 내적 곱으로 예측 R 행렬 생성
  full_pred_matrix = np.dot(P, Q.T)
  # 실제 R 행렬에서 널이 아닌 값의 위치 인덱스 추출하여 실제 R 행렬과 예측 행렬의 RMSE 추출
  x_non_zero_ind = [non_zero[0] for non_zero in non_zeros]
  y_non_zero_ind = [non_zero[1] for non_zero in non_zeros]
  R_non_zeros = R[x_non_zero_ind, y_non_zero_ind]
  full_pred_matrix_non_zeros = full_pred_matrix[x_non_zero_ind, y_non_zero_ind]
  mse = mean_squared_error(R_non_zeros, full_pred_matrix_non_zeros)
  rmse = np.sqrt(mse)
  return rmse

def matrix_factorization(R, K, steps=200, learning_rate=0.01, r_lambda = 0.01):
  num_users, num_items = R.shape
  # P와 Q 매트릭스의 크기를 지정하고 정규분포를 가진 랜덤한 값으로 입력합니다. 
  np.random.seed(1)
  P = np.random.normal(scale=1./K, size=(num_users, K))
  Q = np.random.normal(scale=1./K, size=(num_items, K))

  break_count = 0
       
  # R > 0 인 행 위치, 열 위치, 값을 non_zeros 리스트 객체에 저장. 
  non_zeros = [ (i, j, R[i,j]) for i in range(num_users) for j in range(num_items) if R[i,j] > 0 ]
   
  # SGD기법으로 P와 Q 매트릭스를 계속 업데이트. 
  for step in range(steps):
      for i, j, r in non_zeros:
          # 실제 값과 예측 값의 차이인 오류 값 구함
          eij = r - np.dot(P[i, :], Q[j, :].T)
          # Regularization을 반영한 SGD 업데이트 공식 적용
          P[i,:] = P[i,:] + learning_rate*(eij * Q[j, :] - r_lambda*P[i,:])
          Q[j,:] = Q[j,:] + learning_rate*(eij * P[i, :] - r_lambda*Q[j,:])
      rmse = get_rmse(R, P, Q, non_zeros)
      if (step % 10) == 0 :
          print("### iteration step : ", step," rmse : ", rmse)
  return P, Q

P, Q = matrix_factorization(user_masterpiece_matrix.values, K=50, steps=200, learning_rate=0.01, r_lambda = 0.01)
pred_matrix = np.dot(P, Q.T)

score_pred_matrix = pd.DataFrame(data=pred_matrix, index= user_masterpiece_matrix.index, columns = user_masterpiece_matrix.columns)

def get_unseen_masterpiece(user_masterpiece_matrix, user_Id):
  # user_Id로 입력받은 사용자의 모든 명화정보 추출하여 Series로 반환함. 
  # 반환된  user_masterpiece_score 은 명화명(masterpiece_title)을 index로 가지는 Series 객체임. 
  user_masterpiece_score = user_masterpiece_matrix.loc[user_Id,:]
  # user_masterpiece_score이 0보다 크면 기존에 관람한 명화임. 대상 index를 추출하여 list 객체로 만듬
  already_seen = user_masterpiece_score[user_masterpiece_score > 0].index.tolist()
  # 모든 명화명을 list 객체로 만듬. 
  masterpiece_list = user_masterpiece_matrix.columns.tolist()
  # list comprehension으로 already_seen에 해당하는 masterpiece는 masterpiece_list에서 제외함. 
  unseen_list = [masterpiece for masterpiece in masterpiece_list if masterpiece not in already_seen]
  return unseen_list

def recomm_masterpiece_by_userid(pred_df, user_Id, unseen_list, top=10):
  # 예측 평점 DataFrame에서 사용자id index와 unseen_list로 들어온 명화명 컬럼을 추출하여 가장 예측 평점이 높은 순으로 정렬함. 
  recomm_masterpiece = pred_df.loc[user_Id, unseen_list].sort_values(ascending=False)[:top]
  return recomm_masterpiece



# wooye_cn.py
similarity_rate = cosine_similarity(masterpiece_user_score, masterpiece_user_score)
similarity_rate_df = pd.DataFrame(
    data = similarity_rate,
    index = masterpiece_user_score.index,
    columns = masterpiece_user_score.index)

# 가장 유사도가 높은 top 5
def recommand_masterpiece(masterpiece_title):
  return similarity_rate_df[masterpiece_title].sort_values(ascending=False)[:6]


# app
app = Flask(__name__)
app.config['JSON_AS_ASCII'] = False

# 유저 이름 가져와서 클래식 제목 넣기
@app.route("/recomco")
def recomco():
    # 클래식의 작가, 폼, 시대
    i = 0
    list = copy.deepcopy(content_list)
    for i in range(0, len(content_list), 1):
      start = recommend_classic_list(df_classic, similarity_classic_composer, similarity_classic_era, content_list[i], 1)
      start_list = start.iloc[:1,0].tolist() # -> 클래식 제목만 java로 보내기
      list[i] = start_list
    return list

# 유저 아이디 넣기
@app.route("/recomcp")
def recomcp():
    # 사용자가 관람하지 않는 명화명 추출   
    unseen_list = get_unseen_masterpiece(user_masterpiece_matrix, 'aaa') # -> 유저 이름 넣을 곳1
    # 아이템 기반의 인접 이웃 협업 필터링으로 명화 추천 
    recomm_masterpiece = recomm_masterpiece_by_userid(score_pred_matrix, 'aaa', unseen_list, top=10) # -> 유저 이름 넣을 곳2
    # 평점 데이터를 DataFrame으로 생성. 
    recomm_masterpiece = pd.DataFrame(data=recomm_masterpiece.values,index=recomm_masterpiece.index,columns=['pred_score'])
    recomm_masterpiece_list = recomm_masterpiece.index.tolist() # -> 명화 제목만 java로 보내기
    return recomm_masterpiece_list

# 유저 이름 가져와서 명화 제목 넣기
@app.route("/recomcn")
def recomcn():
    i = 0
    list = copy.deepcopy(cn_list)
    for i in range(0, len(cn_list), 1):
      re_ma = pd.DataFrame(recommand_masterpiece(cn_list[i])) # -> 작품 DB 넣을 곳
      re_ma_title = re_ma.index.tolist() # -> 명화 제목만 java로 보내기
      list[i] = re_ma_title[0]
    return list

if __name__ == '__main__':
    app.run(debug=False,host="127.0.0.1",port=5000)
