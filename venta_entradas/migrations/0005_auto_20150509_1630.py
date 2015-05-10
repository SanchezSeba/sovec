# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('venta_entradas', '0004_auto_20150508_2021'),
    ]

    operations = [
        migrations.AlterUniqueTogether(
            name='reserva',
            unique_together=set([('idFuncion', 'idAsiento')]),
        ),
    ]
