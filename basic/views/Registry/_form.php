<?php

use yii\helpers\Html;
use yii\helpers\ArrayHelper;
use yii\bootstrap\ActiveForm;
use kartik\daterange\DateRangePicker;
use app\models\TypeRegistry;
use app\models\User;

/* @var $this yii\web\View */
/* @var $model app\models\Registry */
/* @var $form yii\widgets\ActiveForm */
?>

<?php $this->registerJs('
    function showUserId()
    {
        $("[name=\'Registry[user_id]\']").removeAttr("disabled");
        $(".field-registry-user_id").show();
    }

    function hideUserId()
    {
        $("[name=\'Registry[user_id]\']").attr("disabled","disabled");
        $(".field-registry-user_id").hide();
    }
    
    function toggleUserId()
    {
        var typeRegistry = 
        $("[name=\'Registry[type_registry_id]\']:checked").val(); 

        if ( typeRegistry != 1 ) {
            showUserId();
        } else {
            hideUserId();
        }
    }

    $("[name=\'Registry[type_registry_id]\']").change(function(){
        toggleUserId();
    });

    toggleUserId();
'); ?>

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

    <?= $form->field($model, 'user_id')->dropDownList(
        ArrayHelper::map(
            User::find()->all(),
            'id',
            function($model, $defaultValue) {
                return $model->first_name.' '.$model->last_name;
            }
        )
    ) ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
