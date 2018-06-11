# import requests
# from lxml import html
# from scrapy.selector import Selector
# from scrapy.utils import response
#
# from BeautifulSoup import BeautifulSoup
#
#
# # print(soup.prettify())
#
# page = requests.get("https://test.salesforce.com", auth=("rn10@jjfsr.com.sit", "Start1234"))
#
# print page.content
# print page.text
#
# root = html.fromstring(page.text)
# print root
# # # body = '<html><body><span>good</span></body></html>'
# # el = Selector(text=soup).xpath('//text()').extract()
# # print el
# # # tree = root.getroottree()
# # print x.select("//input").extract()
# #     # print tree
# #     # //*[@type='text' or @type='password' or @type='checkbox' or @type='submit' or @type='email'
# #
# # result = root.xpath("//*[@type='text' or @type='password' or @type='checkbox' or @type='submit' or @type='email']")
# #  print(result)
# #
# #     for r in result:
# #         print root.xpath(tree.getpath(r) + '/@id'), 'Xpath=%s' % tree.getpath(r)

from bs4 import BeautifulSoup
import urllib
soup = BeautifulSoup(urllib.urlopen("http://google.com").read(), 'lxml')

for link in soup.find_all('*'):
    print(link.get('id'))