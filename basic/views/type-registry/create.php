<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\models\Type_registry */

$this->title = 'Create Type Registry';
$this->params['breadcrumbs'][] = ['label' => 'Type Registries', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="type-registry-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
