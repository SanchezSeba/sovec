# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('venta_entradas', '0005_auto_20150509_1630'),
    ]

    operations = [
        migrations.AlterField(
            model_name='asiento',
            name='numero',
            field=models.IntegerField(unique=True),
        ),
        migrations.AlterUniqueTogether(
            name='asiento',
            unique_together=set([]),
        ),
    ]
