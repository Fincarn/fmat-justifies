<?php

use yii\helpers\Html;
use yii\helpers\ArrayHelper;
use yii\bootstrap\ActiveForm;
use kartik\daterange\DateRangePicker;
use app\models\TypeRegistry;

/* @var $this yii\web\View */
/* @var $model app\models\Registry */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="registry-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'cause')->textarea(['rows' => 6]) ?>

    <?= $form->field($model, 'period_range')->widget(DateRangePicker::classname(), [
        'convertFormat' => true,
        'hideInput' => true,
        'pluginOptions' =>[
            'timePicker' => true,
            'timePickerIncrement' => 15,
            'locale'=>[
                'format'=>'Y-m-d H:i:s',
                'separator'=>' - ',
            ]
        ]
    ]) ?>

    <?= $form->field($model, 'recuperation')->textarea(['rows' => 6]) ?>

    <?= $form->field($model, 'type_registry_id')->radioList(
        ArrayHelper::map(
            TypeRegistry::find()->all(),
            'id',
            'name'
        )
    ) ?>

    <?= $form->field($model, 'user_id')->textInput(['maxlength' => true]) ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
