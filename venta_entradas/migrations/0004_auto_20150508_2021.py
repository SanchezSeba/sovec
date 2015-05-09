# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('venta_entradas', '0003_auto_20150508_1917'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='funcion',
            name='idAsiento',
        ),
        migrations.AddField(
            model_name='funcion',
            name='sala',
            field=models.ForeignKey(default=1, to='venta_entradas.Sala'),
            preserve_default=False,
        ),
        migrations.AlterUniqueTogether(
            name='asiento',
            unique_together=set([('idSala', 'numero')]),
        ),
    ]
