FROM yiisoftware/yii2-php:7.2-apache

ARG DOCUMENT_ROOT
ENV REWRITE='<Directory /app/web/>\n\
        \# use mod_rewrite for pretty URL support\n\
        RewriteEngine on\n\
\n\
        \# if showScriptName is false in UrlManager, do not allow accessing URLs with script name\n\
        RewriteRule ^index.php/ - [L,R=404]\n\
\n\
        \# If a directory or a file exists, use the request directly\n\
        RewriteCond %{REQUEST_FILENAME} !-f\n\
        RewriteCond %{REQUEST_FILENAME} !-d\n\
\n\
        \# Otherwise forward the request to index.php\n\
        RewriteRule . index.php\n\
        '
RUN sed -i -e "s|<Directory /app/web/>|$REWRITE|g" /etc/apache2/sites-available/000-default.conf
# Change document root for Apache
RUN sed -i -e "s|/app/web|$DOCUMENT_ROOT|g" /etc/apache2/sites-available/000-default.conf
