# Generated by Django 4.0.3 on 2022-04-15 05:57

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('api', '0002_planet_residents'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='planet',
            name='residents',
        ),
        migrations.AddField(
            model_name='planet',
            name='residents',
            field=models.ManyToManyField(to='api.person'),
        ),
    ]
