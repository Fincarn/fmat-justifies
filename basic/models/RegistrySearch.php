<?php

namespace app\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\Registry;

/**
 * RegistrySearch represents the model behind the search form about `app\models\Registry`.
 */
class RegistrySearch extends Registry
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'type_registry_id', 'user_id'], 'integer'],
            [['cause', 'period_begin', 'period_end', 'recuperation'], 'safe'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function scenarios()
    {
        // bypass scenarios() implementation in the parent class
        return Model::scenarios();
    }

    /**
     * Creates data provider instance with search query applied
     *
     * @param array $params
     *
     * @return ActiveDataProvider
     */
    public function search($params)
    {
        $query = Registry::find();

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
            'sort'=> ['defaultOrder' => ['period_begin' => SORT_DESC]]
        ]);

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        $query->andFilterWhere([
            'id' => $this->id,
            'period_begin' => $this->period_begin,
            'period_end' => $this->period_end,
            'type_registry_id' => $this->type_registry_id,
            'user_id' => $this->user_id,
        ]);

        $query->andFilterWhere(['like', 'cause', $this->cause])
            ->andFilterWhere(['like', 'recuperation', $this->recuperation]);

        return $dataProvider;
    }
}
