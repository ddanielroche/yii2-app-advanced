<?php
namespace api\controllers;

use yii\rest\ActiveController as BaseActiveController;

class ActiveController extends BaseActiveController
{
    public function behaviors()
    {
        $behaviors = parent::behaviors();
        $behaviors['authenticator'] = [
            'class' => 'yii\filters\auth\CompositeAuth',
            'authMethods' => [
                'yii\filters\auth\HttpBearerAuth',
            ],
        ];
        return $behaviors;
    }
}