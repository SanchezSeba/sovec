# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('venta_entradas', '0008_pelicula_poster'),
    ]

    operations = [
        migrations.AlterField(
            model_name='pelicula',
            name='poster',
            field=models.ImageField(upload_to=b'images/'),
        ),
    ]
