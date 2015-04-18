from django import forms

class UserForm(forms.Form):
    register_username = forms.CharField(max_length=15)
    register_name = forms.CharField(max_length=25, required=False)
    register_last_name = forms.CharField(max_length=25, required=False)
    register_email = forms.EmailField(required=False)
    register_password = forms.CharField(max_length=25)
    re_register_password = forms.CharField(max_length=25)
