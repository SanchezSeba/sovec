# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('venta_entradas', '0007_auto_20150510_0004'),
    ]

    operations = [
        migrations.AddField(
            model_name='pelicula',
            name='poster',
            field=models.CharField(default='ASDADS', max_length=1000),
            preserve_default=False,
        ),
    ]
