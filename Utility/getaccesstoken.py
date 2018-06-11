import requests

def getAccesstoken(token_url,client_id,client_secret,user,password):

    data = {'grant_type': 'password','client_id': client_id, 'client_secret': client_secret,'username': user, 'password': password}
    access_token_response = requests.post(token_url, data=data)

    new_dict = access_token_response.json()
    status = access_token_response.status_code
    if(status == 200):
        return new_dict['access_token']
    else:
        return None

def statuscode(token_url,client_id,client_secret,user,password):
    data = {'grant_type': 'password','client_id': client_id, 'client_secret': client_secret,'username': user, 'password': password}
    access_token_response = requests.post(token_url, data=data)
    status = access_token_response.status_code
    return status
