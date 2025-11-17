FROM busybox
COPY app.txt /app/app.txt
CMD ["sh", "-c", "cat /app/app.txt && sleep 30"]