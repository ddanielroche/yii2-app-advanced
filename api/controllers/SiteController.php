<?php
namespace api\controllers;

use yii\rest\Controller;

/**
 * Site controller
 */
class SiteController extends Controller
{

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
