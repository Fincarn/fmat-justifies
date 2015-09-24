<?php

namespace app\models;

use Yii;

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
            [['cause', 'period_begin', 'type_registry_id', 'user_id'], 'required'],
            [['cause', 'recuperation'], 'string'],
            [['type_registry_id', 'user_id'], 'integer'],
            [['period_begin', 'period_end'],'date', 'format'=>'yyyy-mm-dd H:m']
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'cause' => 'Cause',
            'period_begin' => 'Period Begin',
            'period_end' => 'Period End',
            'recuperation' => 'Recuperation',
            'type_registry_id' => 'Type Registry ID',
            'user_id' => 'User ID',
        ];
    }
}
