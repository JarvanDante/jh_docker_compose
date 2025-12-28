FROM tme-it-hr.tencentcloudcr.com/kgkpi/api_mid:v1.0.1
ADD ./TME_KG_STOCK_POINTS_API /var/www/html/TME_KG_STOCK_POINTS_API
ADD ./.env /var/www/html/TME_KG_STOCK_POINTS_API/.env
RUN chmod -R 777 /var/www/html/TME_KG_STOCK_POINTS_API/public/
RUN chmod -R 777 /var/www/html/TME_KG_STOCK_POINTS_API/storage/
RUN chmod -R 777 /var/www/html/TME_KG_STOCK_POINTS_API/bootstrap/
WORKDIR  /var/www/html/TME_KG_STOCK_POINTS_API
EXPOSE 9000
