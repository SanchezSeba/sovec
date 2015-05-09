# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
from django.conf import settings


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='Asiento',
            fields=[
                ('idAsiento', models.AutoField(serialize=False, primary_key=True)),
                ('numero', models.IntegerField()),
            ],
        ),
        migrations.CreateModel(
            name='Funcion',
            fields=[
                ('idFuncion', models.AutoField(serialize=False, primary_key=True)),
                ('hora_inicio', models.DateTimeField()),
                ('idAsiento', models.ForeignKey(to='venta_entradas.Asiento')),
            ],
        ),
        migrations.CreateModel(
            name='Pelicula',
            fields=[
                ('idPelicula', models.AutoField(serialize=False, primary_key=True)),
                ('nombre', models.CharField(max_length=100)),
                ('descripcion', models.CharField(max_length=1000)),
                ('duracion', models.DateTimeField()),
            ],
        ),
        migrations.CreateModel(
            name='Reserva',
            fields=[
                ('idReserva', models.AutoField(serialize=False, primary_key=True)),
                ('idAsiento', models.ForeignKey(to='venta_entradas.Asiento')),
                ('idFuncion', models.ForeignKey(to='venta_entradas.Funcion')),
                ('idUsuario_asigna', models.ForeignKey(related_name='reserva_asigna', to=settings.AUTH_USER_MODEL)),
                ('idUsuario_asiste', models.ForeignKey(related_name='reserva_asiste', to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='Sala',
            fields=[
                ('idSala', models.AutoField(serialize=False, primary_key=True)),
                ('numero', models.IntegerField()),
            ],
        ),
        migrations.AddField(
            model_name='funcion',
            name='idPelicula',
            field=models.ForeignKey(to='venta_entradas.Pelicula'),
        ),
        migrations.AddField(
            model_name='asiento',
            name='idSala',
            field=models.ForeignKey(to='venta_entradas.Sala'),
        ),
    ]
