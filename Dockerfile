# Multi-stage Build for smaller image size

FROM node:20-alpine as Builder

WORKDIR /app

COPY package*.json ./

RUN npm ci 

COPY . .

RUN npm run build || echo "No Build step Needed"

# Production Image ? stage

FROM node:20-alpine

WORKDIR /app

# Create a non-root user and switch to it
RUN addgroup -S nodejs && adduser -S deepak -G nodejs

# Copy only production deps

# copy from the builder stage
COPY --from=builder --chown=deepak:nodejs /app .

# Remove dev dependencies
RUN npm prune --production

#swtich to non root 

USER deepak


EXPOSE 3000

HEALTHCHECK --interval=30s --timeout=3s \
  CMD curl -f http://localhost:3000/ || exit 1

CMD ["node", "index.js"]

