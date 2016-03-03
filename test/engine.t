It works

  $ docker run --rm \
  >   --volume "$TESTDIR":/code:ro \
  >   codeclimate/codeclimate-gnu-complexity 2>/dev/null | tr "\0" "\n"
  {"type":"issue","check_name":"complex-definition","description":"High complexity in `scale10_round_decimal_decoded`: [32/30]","categories":["Complexity"],"location":{"path":"fixtures/vasnprintf.c","lines":{"begin":1073,"end":1073}},"remediation_points":50000,"severity":"normal","fingerprint":"gnu-complexity-fixtures/vasnprintf.c-scale10_round_decimal_decoded"}
  {"type":"issue","check_name":"complex-definition","description":"High complexity in `PRINTF_FETCHARGS`: [41/30]","categories":["Complexity"],"location":{"path":"fixtures/printf-args.c","lines":{"begin":37,"end":37}},"remediation_points":50000,"severity":"normal","fingerprint":"gnu-complexity-fixtures/printf-args.c-PRINTF_FETCHARGS"}
  {"type":"issue","check_name":"complex-definition","description":"High complexity in `divide`: [52/30]","categories":["Complexity"],"location":{"path":"fixtures/vasnprintf.c","lines":{"begin":416,"end":416}},"remediation_points":50000,"severity":"normal","fingerprint":"gnu-complexity-fixtures/vasnprintf.c-divide"}
  {"type":"issue","check_name":"complex-definition","description":"High complexity in `PRINTF_PARSE`: [217/30]","categories":["Complexity"],"location":{"path":"fixtures/printf-parse.c","lines":{"begin":84,"end":84}},"remediation_points":50000,"severity":"normal","fingerprint":"gnu-complexity-fixtures/printf-parse.c-PRINTF_PARSE"}

It works with include_paths via /config.json

  $ echo '{"include_paths":["fixtures/printf-args.c"]}' > config.json
  > docker run --rm \
  >   --volume "$TESTDIR":/code:ro \
  >   --volume "$PWD"/config.json:/config.json:ro \
  >   codeclimate/codeclimate-gnu-complexity 2>/dev/null | tr "\0" "\n"
  {"type":"issue","check_name":"complex-definition","description":"High complexity in `PRINTF_FETCHARGS`: [41/30]","categories":["Complexity"],"location":{"path":"fixtures/printf-args.c","lines":{"begin":37,"end":37}},"remediation_points":50000,"severity":"normal","fingerprint":"gnu-complexity-fixtures/printf-args.c-PRINTF_FETCHARGS"}

It works with config.threshold via /config.json

  $ echo '{"include_paths":["./"],"config":{"threshold":210}}' > config.json
  > docker run --rm \
  >   --volume "$TESTDIR":/code:ro \
  >   --volume "$PWD"/config.json:/config.json:ro \
  >   codeclimate/codeclimate-gnu-complexity 2>/dev/null | tr "\0" "\n"
  {"type":"issue","check_name":"complex-definition","description":"High complexity in `PRINTF_PARSE`: [217/210]","categories":["Complexity"],"location":{"path":"fixtures/printf-parse.c","lines":{"begin":84,"end":84}},"remediation_points":50000,"severity":"normal","fingerprint":"gnu-complexity-fixtures/printf-parse.c-PRINTF_PARSE"}
