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

    <?= DetailView::widget('zii.widgets.jui.CJuiDatePicker',[
        'model' => $model,
        'attributes' => [
            'id',
            'cause:ntext',
            'period_begin'=> 'from_date',
                'language' => 'es',
                'dateFormat' => 'yyyy-MM-dd',
            'period_end',
            'recuperation:ntext',
            'type_registry_id',
            'user_id',
        ],
    ]) ?>

</div>
