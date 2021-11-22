from django.db import models


class Website(models.Model):
    company = models.CharField(max_length=200)
    url = models.CharField(max_length=200)


class Vulnerability(models.Model):
    details = models.TextField()
    verified = models.BooleanField()
