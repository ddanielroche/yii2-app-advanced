<?php
namespace api\controllers;

use Yii;
use yii\helpers\Url;
use yii\rest\Controller;

/**
 * Site controller
 */
class SiteController extends Controller
{

    public function actions()
    {
        return [
            //The document preview addesss:http://api.yourhost.com/site/doc
            'doc' => [
                'class' => 'light\swagger\SwaggerAction',
                'restUrl' => Url::to(['/site/api'], true),
            ],
            //The resultUrl action.
            'api' => [
                'class' => 'light\swagger\SwaggerApiAction',
                //The scan directories, you should use real path there.
                'scanDir' => [
                    Yii::getAlias('@vendor/zircote/swagger-php/Examples/petstore.swagger.io'),
                ],
                //The security key
                'api_key' => 'balbalbal',
            ],
        ];
    }


    /**
     * Displays homepage.
     *
     * @return mixed
     */
    public function actionIndex()
    {
        return ['data' => 'hello world!'];
    }
}
