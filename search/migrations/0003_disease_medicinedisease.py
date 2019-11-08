# Generated by Django 2.2.5 on 2019-11-08 10:58

from django.db import migrations, models
import django.db.models.deletion
import uuid


class Migration(migrations.Migration):

    dependencies = [
        ('search', '0002_medicine_pharmacymedicine'),
    ]

    operations = [
        migrations.CreateModel(
            name='Disease',
            fields=[
                ('id', models.UUIDField(default=uuid.uuid4, editable=False, primary_key=True, serialize=False)),
                ('name', models.CharField(max_length=255)),
                ('description', models.TextField()),
                ('image_url', models.CharField(default='', max_length=200)),
                ('timestamp', models.DateTimeField(auto_now_add=True)),
            ],
        ),
        migrations.CreateModel(
            name='MedicineDisease',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('timestamp', models.DateTimeField(auto_now_add=True)),
                ('disease', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='medicinedisease', to='search.Disease')),
                ('medicine', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='medicinedisease', to='search.Medicine')),
            ],
            options={
                'unique_together': {('medicine', 'disease')},
            },
        ),
    ]
