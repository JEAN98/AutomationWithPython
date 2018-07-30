import json

import json

registerJsonData = """ 
{
    "register": [
        {
        "firstName":"nameHere Carlo","lastName":"lastNameHere","email":"emailhere","userName":"usernamehere","password":"passwordHere","confirmPassword":"confirmdata","securityQuestion":"questionHere","securityAnswer":"answerdata"
        },
        {
            "firstName":"nameHere","lastName":"lastNameHere","email":"emailhere","userName":"usernamehere","password":"passwordHere","confirmPassword":"confirmdata","securityQuestion":"questionHere","securityAnswer":"answerdata"
        }
    ]
 }"""

def get_dict():
    my_dict = json.loads(registerJsonData)
    return my_dict


registerDifferentPassword= """ 
{
    "register": [
        {
        "firstName":"nameHere","lastName":"lastNameHere","email":"emailhere","userName":"usernamehere","password":"passwordHere","confirmPassword":"confirmdata","securityQuestion":"questionHere","securityAnswer":"answerdata"
        },
        {
            "firstName":"nameHere","lastName":"lastNameHere","email":"emailhere","userName":"usernamehere","password":"passwordHere","confirmPassword":"confirmdata","securityQuestion":"questionHere","securityAnswer":"answerdata"
        }
    ]
 }"""


def get_dict_different_password():
    diferrentPasswordDict = json.loads(registerDifferentPassword)
    return diferrentPasswordDict

registerUserNameTaken= """ 
{
     "register": [
        {
        "firstName":"nameHere","lastName":"lastNameHere","email":"emailhere","userName":"usernamehere","password":"passwordHere","confirmPassword":"confirmdata","securityQuestion":"questionHere","securityAnswer":"answerdata"
        },
        {
            "firstName":"nameHere","lastName":"lastNameHere","email":"emailhere","userName":"usernamehere","password":"passwordHere","confirmPassword":"confirmdata","securityQuestion":"questionHere","securityAnswer":"answerdata"
        }
    ]
 }"""

def get_dict_user_name_taken():
    userNameTakenDict = json.loads(registerUserNameTaken)
    return userNameTakenDict