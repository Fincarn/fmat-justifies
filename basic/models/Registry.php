<?php

namespace app\models;

use Yii;
use yii\web\ForbiddenHttpException;

/**
 * This is the model class for table "Registry".
 *
 * @property string $id
 * @property string $cause
 * @property string $period_begin
 * @property string $period_end
 * @property string $recuperation
 * @property string $type_registry_id
 * @property string $user_id
 */
class Registry extends \yii\db\ActiveRecord
{
    public $period_range;

    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'Registry';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['cause','type_registry_id','period_range'], 'required'],
            [['cause', 'recuperation'], 'string'],
            [['type_registry_id', 'user_id'], 'integer'],
            [['type_registry_id'],'exist','targetClass'=>'app\models\TypeRegistry','targetAttribute'=>'id'],
            [['user_id'],'exist','targetClass'=>'app\models\User','targetAttribute'=>'id', 'skipOnEmpty'=>false, 'on'=>'Create'],
            [['user_id'],'exist','targetClass'=>'app\models\User','targetAttribute'=>'id', 'skipOnEmpty'=>true, 'on'=>'Update'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' =>  Yii::t('app', 'ID'),
            'cause' =>  Yii::t('app', 'Cause'),
            'period_begin' =>  Yii::t('app', 'Period Begin'),
            'period_end' =>  Yii::t('app', 'Period End'),
            'recuperation' =>  Yii::t('app', 'Recuperation'),
            'type_registry_id' =>  Yii::t('app', 'Type Registry ID'),
            'user_id' =>  Yii::t('app', 'User ID'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getTypeRegistry()
    {
        return $this->hasOne(TypeRegistry::className(), ['id' => 'type_registry_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getUser()
    {
        return $this->hasOne(User::className(), ['id' => 'user_id']);
    }   

    public static function findDireccion()
    {
        return Registry::findDiasEconomicos()->orWhere(['type_registry_id'=>3]);
    }

    public static function findSecretaria()
    {
        return Registry::findComision();
    }

    public static function findEmpleado()
    {
        return Registry::findPropia();
    }

    public static function findJustificante()
    {
        return parent::find()->Where(['type_registry_id'=>1]);
    }

    private static function findDiasEconomicos()
    {
        return Registry::findPropia()->orWhere(['type_registry_id'=>2]);
    }

    private static function findIncapacidades()
    {
        return Registry::findPropia()->orWhere(['type_registry_id'=>3]);
    }

    private static function findComision()
    {
        return Registry::findPropia()->orWhere(['type_registry_id'=>4]);
    }

    private static function findPropia()
    {
        return Registry::findJustificante()->andWhere(['user_id'=>Yii::$app->user->id]);
    }



    public function beforeSave($insert)
    {
        if(parent::beforeSave($insert))
        {
            $rangeDates = explode(' - ', $this->period_range);
            $this->period_begin = $rangeDates[0];
            $this->period_end = $rangeDates[1];

            switch ($this->type_registry_id) {
                case 1:
                    $this->user_id = Yii::$app->user->identity->id;
                    return true;
                break;
                case 2:
                    if(Yii::$app->user->can('RegisterEconomicDays')){
                        return true;
                    }else{
                        throw new ForbiddenHttpException;
                    }
                    return false;
                break;
                case 3:
                    if(Yii::$app->user->can('RegisterDisabilities')){
                        return true;
                    }else{
                        throw new ForbiddenHttpException;
                    }
                    return false;
                break;
                 case 4:
                    if(Yii::$app->user->can('RegisterComitions')){
                        return true;
                    }else{
                        throw new ForbiddenHttpException;
                    }
                break;
            }
        }
        return false;
    }    

                                                 
}
