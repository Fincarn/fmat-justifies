<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use mackiavelly\juidatetimepicker\JuiDatetimePicker;

/* @var $this yii\web\View */
/* @var $model app\models\Registry */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="registry-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'cause')->textarea(['rows' => 6]) ?>

    <?= $form->field($model, 'period_begin')->widget(\mackiavelly\juidatetimepicker\JuiDatetimePicker::classname(), [
        'dateFormat' => 'yyyy-MM-dd',
        'timeFormat' => 'HH:mm:ss',
    ]) ?>

    <?= $form->field($model, 'period_end')->widget(\mackiavelly\juidatetimepicker\JuiDatetimePicker::classname(), [
        'dateFormat' => 'yyyy-MM-dd',
        'timeFormat' => 'HH:mm:ss',
    ]) ?>

    <?= $form->field($model, 'recuperation')->textarea(['rows' => 6]) ?>

    <?= $form->field($model, 'type_registry_id')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'user_id')->textInput(['maxlength' => true]) ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
