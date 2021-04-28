use actix_web::{web, App, HttpResponse, HttpServer};

async fn health() -> actix_web::Result<HttpResponse> {
    Ok(HttpResponse::Ok().body("ok"))
}

#[actix_web::main]
async fn main() -> std::io::Result<()> {
    HttpServer::new(|| App::new().route("/", web::get().to(health)))
        .bind("0.0.0.0:8080")?
        .run()
        .await
}
