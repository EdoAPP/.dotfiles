function fms-run --wraps='concurrently "temporal server start-dev" "pnpm run start:dev core-ledger" "pnpm run start:dev auth" "pnpm run start:dev organizations" "pnpm run start:dev fms"' --description 'alias fms-run concurrently "temporal server start-dev" "pnpm run start:dev core-ledger" "pnpm run start:dev auth" "pnpm run start:dev organizations" "pnpm run start:dev fms"'
  concurrently "temporal server start-dev" "pnpm run start:dev core-ledger" "pnpm run start:dev auth" "pnpm run start:dev organizations" "pnpm run start:dev fms" $argv
        
end
