# Generated by Django 2.2.5 on 2019-11-09 05:08

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('search', '0003_symptom'),
    ]

    operations = [
        migrations.CreateModel(
            name='Sells',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('timestamp', models.DateTimeField(auto_now_add=True)),
                ('medicine', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='sells', to='search.Medicine')),
                ('pharmacy', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='sells', to='search.Pharmacy')),
            ],
            options={
                'unique_together': {('pharmacy', 'medicine')},
            },
        ),
        migrations.CreateModel(
            name='Shows',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('timestamp', models.DateTimeField(auto_now_add=True)),
                ('disease', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='shows', to='search.Disease')),
            ],
        ),
        migrations.RenameField(
            model_name='symptom',
            old_name='symptom',
            new_name='name',
        ),
        migrations.AlterField(
            model_name='treatment',
            name='disease',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='treatment', to='search.Disease'),
        ),
        migrations.AlterField(
            model_name='treatment',
            name='medicine',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='treatment', to='search.Medicine'),
        ),
        migrations.DeleteModel(
            name='SoldAt',
        ),
        migrations.AddField(
            model_name='shows',
            name='symptom',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='shows', to='search.Symptom'),
        ),
        migrations.AlterUniqueTogether(
            name='shows',
            unique_together={('disease', 'symptom')},
        ),
    ]
