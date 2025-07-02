import requests
import json
url = 'https://jsonplaceholder.typicode.com/posts/1'
response = requests.get(url)
data=response.json()
print('this is the raw form of the fetched data: ', data, sep='\n')
tran_data={
    'Title' : data['title'].upper(),
    'Summary' : data['body'].capitalize()
}
print('')
print("transformed data:", tran_data, sep='\n')

with open('transformed_data.json', 'w') as file:
    json.dump(tran_data, file, indent=4)
print('')
print('data obtained successfully!')