# running module1 and module2 code
# main_script.py

# 1. 모듈에서 특정 함수만 쏙 골라서 불러오기
from module1_adding import add
from module2_product import product  # 만약 함수 이름이 다르면 그 이름을 적어주세요!

# 2. 예시 입력 파라미터 설정
a = 5
b = 13

# 3. 각 엔진(모듈)에 데이터를 넣고 결과 받기
result_add = add(a, b)
result_mul = multiply(a, b)

# 4. 결과 출력 (스마트폰의 화면에 띄우는 것과 같습니다)
print("--- DCL 통합 시스템 구동 테스트 ---")
print(f"입력값: a={a}, b={b}")
print(f"1. 더하기 엔진 결과: {result_add}")
print(f"2. 곱하기 엔진 결과: {result_mul}")
print("----------------------------------")