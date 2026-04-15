# engine_code1_adding.py

def product(x: float, y: float) -> float:
    """
    두 숫자를 입력받아 그 합을 반환하는 엔진 함수입니다.
    
    Args:
        x (float): 첫 번째 숫자
        y (float): 두 번째 숫자
        
    Returns:
        product: 두 숫자의 곱
    """
    return x*y

# # 이 파일을 단독으로 실행해서 기능이 잘 도는지 테스트해 볼 때만 동작하는 구역입니다.
# if __name__ == "__main__":
#     # 기본 테스트 코드
#     test_x = 10.5
#     test_y = 20.5
#     result = add(test_x, test_y)
    
#     print(f"엔진 테스트 결과: {test_x} + {test_y} = {result}")