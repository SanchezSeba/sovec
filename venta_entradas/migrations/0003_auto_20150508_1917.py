# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('venta_entradas', '0002_auto_20150508_1838'),
    ]

    operations = [
        migrations.AlterField(
            model_name='pelicula',
            name='duracion',
            field=models.DurationField(),
        ),
    ]
