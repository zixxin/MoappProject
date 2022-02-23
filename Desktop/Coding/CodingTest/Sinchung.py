from selenium import webdriver
#from selenium.webdriver.chrome.service import Service
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
import time

print('신청하러 가즈아')

#크롬 웹드라이버 사용 (웹 페이지 테스트용으로 제공되는 무언가..?)
options = webdriver.ChromeOptions()
#gpu 사용안함. 안에 headless를 적으면 안보이게 실행됨.
options.add_argument("disable-gpu")
driver = webdriver.Chrome("/Users/gloryko/Desktop/chromedriver", options=options)
#반대 개념으로 explicitly가 있는데 일부분이 나타날 때까지 기다리는 것 지정한 초 이내에 뜨지 않으면 강제로 밑에 코드 실행
driver.implicitly_wait(3)

driver.get('http://sugang.handong.edu/loginsugang.html')
driver.find_elements_by_xpath('//input[@type="image"]')[0].click()