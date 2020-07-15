module.exports = {
  settings: {
    'import/resolver': {
      'babel-module': {},
    },
  },
  env: {
    browser: true,
    jest: true,
  },
  extends: [
    'standard',
    'plugin:import/errors',
    'plugin:import/warnings',
    'plugin:promise/recommended',
    'plugin:prettier/recommended', // Enables eslint-plugin-prettier and displays prettier errors as ESLint errors. Make sure this is always the last configuration in the extends array.
    'plugin:jsx-a11y/recommended',
    'prettier',
  ],
  plugins: ['prettier'],
  overrides: [
    {
      files: ['*.ts', '*.tsx'],
      parser: '@typescript-eslint/parser',
      extends: [
        'standard',
        'plugin:@typescript-eslint/recommended',
        'plugin:import/errors',
        'plugin:import/warnings',
        'plugin:import/typescript',
        'plugin:promise/recommended',
        'plugin:prettier/recommended', // Enables eslint-plugin-prettier and displays prettier errors as ESLint errors. Make sure this is always the last configuration in the extends array.
        'plugin:jsx-a11y/recommended',
        'prettier',
        'prettier/@typescript-eslint',
      ],
      plugins: ['prettier'],
      parserOptions: {
        ecmaversion: 2018,
        project: './tsconfig.json',
        sourceType: 'module',
      },
      settings: {
        'import/resolver': {
          'babel-module': {},
        },
      },
      rules: {
        'react/react-in-jsx-scope': 0,
        'ordered-imports': 0,
        quotemark: 0,
        'no-console': 0,
        semicolon: 0,
        'jsx-no-lambda': 0,
        camelcase: 0,
        '@typescript-eslint/interface-name-prefix': 0,
        '@typescript-eslint/naming-convention': [
          'error',
          {
            selector: 'default',
            format: ['camelCase', 'UPPER_CASE', 'snake_case'],
            filter: {
              regex: '^[A-Z]([A-Z][a-zA-Z]+|\\d+)?$',
              match: true,
            },
            leadingUnderscore: 'forbid',
          },
          {
            selector: 'class',
            format: ['PascalCase'],
          },
          {
            selector: 'property',
            modifiers: ['readonly'],
            format: ['camelCase', 'UPPER_CASE'],
          },
          {
            selector: 'property',
            types: ['boolean'],
            format: ['PascalCase'],
            prefix: ['is', 'should', 'has', 'can', 'did', 'will'],
          },
          {
            selector: 'memberLike',
            modifiers: ['protected'],
            format: ['camelCase'],
            leadingUnderscore: 'require',
          },
          {
            selector: 'memberLike',
            modifiers: ['private'],
            format: ['camelCase'],
            leadingUnderscore: 'require',
          },
          {
            selector: 'variable',
            format: ['PascalCase', 'camelCase', 'UPPER_CASE'],
          },
          {
            selector: 'interface',
            format: ['PascalCase'],
            custom: {
              regex: '^I[A-Z]',
              match: true,
            },
          },
          {
            selector: 'variable',
            types: ['boolean'],
            format: ['PascalCase'],
            prefix: ['is', 'should', 'has', 'can', 'did', 'will'],
          },
          {
            selector: 'typeParameter',
            format: ['PascalCase'],
            prefix: ['T'],
          },
        ],
      },
    },
    {
      files: ['**/*.tsx'],
      rules: {
        'react/prop-types': 'off',
      },
    },
  ],
}
