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
class TypeRegistry extends \yii\db\ActiveRecord
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
            [['name'], 'required'],
            [['name'], 'string', 'max' => 45],
            [['name'], 'unique'],
            [['description'], 'string', 'max' => 175]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'name' => Yii::t('app', 'Name'),
            'description' => Yii::t('app', 'Description'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getRegistries()
    {
        return $this->hasMany(Registry::className(), ['type_registry_id' => 'id']);
    }

        public static function findRoles()
    {
        $roles=Yii::$app->authManager->getRolesByUser(Yii::$app->user->getId());
        foreach ($roles as $role)
        {
            switch ($role->name) {
                case 'Empleado':
                    return parent::find()->where(['id'=>1]);
                break;
                case 'Dirección General':
                    return TypeRegistry::findDireccion()->orWhere(['id'=>3]);
                break;                
                case 'Secretaria Administrativa':
                    return TypeRegistry::findBase()->orWhere(['id'=>4]);
                break;
                case 'Administrator':
                    return parent::find();
                break;
            }
        }
    }

        private static function findDireccion()
    {
        return TypeRegistry::findBase()->orWhere(['id'=>2]);
    }

        private static function findBase()
    {
        return parent::find()->where(['id'=>1]);
    }
}
