# syntax=docker/dockerfile:1


ARG NODE_VERSION=22.1.0
ARG PNPM_VERSION=8.15.4


FROM --platform=linux/amd64 node:${NODE_VERSION}-alpine as base

ENV PNPM_HOME="/pnpm"
ENV PATH="${PNPM_HOME}:${PATH}"
RUN corepack enable

# Set the working directory for any subsequent 
# ADD, COPY, CMD, ENTRYPOINT, or RUN instructions
# that follow it in the Dockerfile.
WORKDIR /app
COPY . /app

FROM base as prod-deps
RUN --mount=type=cache,id=pnpm,target=/pnpm/store \
    pnpm install --prod --frozen-lockfile


FROM base as build
RUN --mount=type=cache,id=pnpm,target=/pnpm/store \
    pnpm install --frozen-lockfile
RUN pnpm run build


FROM base
COPY --from=prod-deps /app/node_modules /app/node_modules
COPY --from=build /app/dist /app/dist

EXPOSE 3000

CMD pnpm start







