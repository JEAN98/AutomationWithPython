class RegisterEntite():
    def __init__(self):
        self.firstName = None
        self.lastName = None
        self.email = None
        self.userName = None
        self.password = None
        self.repassword = None
        self.question = None
        self.answer = None

    def set_firstName(self,firstName):
        self.firstName = firstName

    def set_lastName(self,lastName):
        self.lastName = lastName

    def set_email(self,email):
        self.email = email

    def set_userName(self,userName):
        self.userName = userName

    def set_password(self,password):
        self.password = password

    def set_repassword(self,repassword):
        self.repassword = repassword

    def set_question(self,question):
        self.question = question

    def set_answer(self,answer):
        self.answer = answer
