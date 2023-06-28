from django.shortcuts import render
import pymysql
import json

# Create your views here.

def index(request):
    # 데이터베이스 연결
    conn = pymysql.connect(host="team4rds.cpa0spimmjj8.us-east-2.rds.amazonaws.com", port=3306, user='admin', passwd='team4123', db='bigdata_location', charset='utf8')
    cur = conn.cursor()
    #쿼리 실행
    query = "SELECT * FROM alcohol_data"
    cur.execute(query)
    rows = cur.fetchall()

    #결과 처리
    main_line_lbl = []
    main_line_val = []
    for row in rows:
        main_line_lbl.append(row[2])
        main_line_val.append(row[1])
        
    # 결과를 JSON 형식으로 변환
    contx_dic = {
        'main_line_lbl': main_line_lbl,
        'main_line_val': main_line_val,
    }
    result = json.dumps(contx_dic, ensure_ascii=False)
    print(result)
    context = {'result': result}

    #연결 및 커서 닫기
    cur.close()
    conn.close()

    return render(request, 'recc/reccomend.html', {'rows':rows})
