# Generated by Django 4.0.3 on 2022-04-15 10:58

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('api', '0007_remove_person_species'),
    ]

    operations = [
        migrations.AlterField(
            model_name='planet',
            name='residents',
            field=models.ManyToManyField(null=True, to='api.person'),
        ),
    ]
