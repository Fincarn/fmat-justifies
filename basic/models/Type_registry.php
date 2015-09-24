<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "type_registry".
 *
 * @property string $id
 * @property string $name
 * @property string $description
 *
 * @property Registry[] $registries
 */
class Type_registry extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'type_registry';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['name', 'description'], 'required'],
            [['name', 'description'], 'string', 'max' => 45],
            [['description'], 'unique']
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'name' => 'Name',
            'description' => 'Description',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getRegistries()
    {
        return $this->hasMany(Registry::className(), ['type_registry_id' => 'id']);
    }
}
