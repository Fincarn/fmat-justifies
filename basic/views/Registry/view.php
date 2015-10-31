<?php

use yii\helpers\Html;
use yii\widgets\DetailView;
use yii\jui\DatePicker;

/* @var $this yii\web\View */
/* @var $model app\models\Registry */

$this->title = $model->id;
$this->params['breadcrumbs'][] = ['label' => 'Registries', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="registry-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Update', ['update', 'id' => $model->id], ['class' => 'btn btn-primary']) ?>
        <?= Html::a('Delete', ['delete', 'id' => $model->id], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => 'Are you sure you want to delete this item?',
                'method' => 'post',
            ],
        ]) ?>
    </p>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'id',
            'cause',
            'period_begin',
            'period_end',
            'recuperation',
            'typeRegistry.name',
            'user.first_name',
            'user.last_name'
        ],
    ]) ?>

</div>
