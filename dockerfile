FROM rust:1.63
ENV PATH="$HOME/.cargo/bin:$PATH"

#build環境
WORKDIR /rust-todo

#ビルドに必要なファイルをコピー
COPY Cargo.toml Cargo.toml
COPY ./src ./src
COPY ./templates ./templates

#build
RUN cargo build --release

#パスの通った場所にインストール
RUN cargo install --path .

#コンテナ起動時にアプリを起動
CMD ["rust-todo"]