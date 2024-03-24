FROM metabase/metabase:v0.49.1 as build
FROM eclipse-temurin:21.0.2_13-jre-alpine

COPY --from=build /app /app

RUN adduser -s /bin/sh -D metabase && chown -R metabase /app && chmod +x /app/run_metabase.sh

WORKDIR /app
USER metabase

ENTRYPOINT ["/app/run_metabase.sh"]
