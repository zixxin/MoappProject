from selenium import webdriver
#from selenium.webdriver.chrome.service import Service
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
import time

while(1):
    print('자리 하나만 주라')
    options = webdriver.ChromeOptions()
    options.add_argument("headless")
    options.add_argument("disable-gpu")
    driver = webdriver.Chrome("/Users/gloryko/Desktop/chromedriver", options=options)
    driver.implicitly_wait(3)
    driver.get('https://hisnet.handong.edu/')
    wait = WebDriverWait(driver, 10)
    #driver.switch_to_frame('MainFrame')
    driver.switch_to.frame('MainFrame')
    wait.until(EC.visibility_of_element_located((By.NAME, 'id')))
    id = driver.find_element_by_name('id')
    id.send_keys('fpqpsxh')
    pw = driver.find_element_by_name('password')
    pw.send_keys('dud@3901')
    driver.find_elements_by_xpath('//input[@type="image"]')[0].click()
    driver.get(
        'https://hisnet.handong.edu/for_student/course/PLES430M.php?hak_year=2022&hak_term=1&prof_name=&gwamok=Data&gwamok_code=&hakbu=%C0%FC%C3%BC&isugbn=%C0%FC%C3%BC&injung=%C0%FC%C3%BC&ksearch=search')
    data = driver.find_elements_by_id('att_list')[0].text.split('\n')
    data_list = []
    for i in range(10, 16):
        data_list.append(data[i])
    val = data_list[3].split(' ')[8]
    ex = data_list[3].split(' ')[7]
    if(ex == val):
        print('자리가 없다….')
    if(ex > val):
        print('공석이다!!')
    if (ex < val):
        print('왠 초과신청??')
    driver.quit()
    print('10초 기다리는중…')
    time.sleep(10)