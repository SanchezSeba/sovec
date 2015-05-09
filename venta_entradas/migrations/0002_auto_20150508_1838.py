# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import durationfield.db.models.fields.duration


class Migration(migrations.Migration):

    dependencies = [
        ('venta_entradas', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='pelicula',
            name='duracion',
            field=durationfield.db.models.fields.duration.DurationField(),
        ),
    ]
