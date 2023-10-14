-- Função para ler um tabuleiro do arquivo
leArq :: FilePath -> IO String
leArq tabuleiro = readFile tabuleiro

-- Função para transformar uma string em uma lista de inteiros
transformaInt :: String -> [Int]
transformaInt conteudo = map read (words conteudo)

-- Função para criar uma lista de tuplas a partir de uma lista de inteiros
criaTuplas :: [Int] -> [(Int, (Int, Int))]
criaTuplas lista = zip lista [(x, y) | x <- [0..8], y <- [0..8]]

-- Função para escrever uma lista no formato de tabuleiro
escreveLista :: [(Int, (Int, Int))] -> String
escreveLista lista = unlines [unwords [show (fst (lista !! (x * 9 + y))) | y <- [0..8]] | x <- [0..8]]

-- Função para encontrar a próxima célula vazia no tabuleiro
achaProx0 :: [(Int, (Int, Int))] -> Maybe (Int, (Int, Int))
achaProx0 listaIntPosi = case filter (\(val, _) -> val == 0) listaIntPosi of
    [] -> Nothing
    (x:xs) -> Just x

-- Função para testar se um valor pode ser inserido em uma linha
testaConLinha :: [(Int, (Int, Int))] -> Int -> Int -> Bool
testaConLinha listaIntPosi valor linha =
    not (any (\(val, (lin, _)) -> lin == linha && val == valor) listaIntPosi)

-- Função para testar se um valor pode ser inserido em uma coluna
testaConColuna :: [(Int, (Int, Int))] -> Int -> Int -> Bool
testaConColuna listaIntPosi valor coluna =
    not (any (\(val, (_, col)) -> col == coluna && val == valor) listaIntPosi)

-- Função para testar se um valor pode ser inserido em um quadrante
testaConQuadrante :: [(Int, (Int, Int))] -> Int -> Int -> Int -> Bool
testaConQuadrante listaIntPosi valor linha coluna =
    let quadranteDeElemento (x, y) = (x `div` 3, y `div` 3)
        quadranteDeValor = quadranteDeElemento (linha, coluna)
        elementosNoMesmoQuadrante = filter (\(_, (x, y)) -> quadranteDeElemento (x, y) == quadranteDeValor) listaIntPosi
        valoresNoMesmoQuadrante = [val | (val, _) <- elementosNoMesmoQuadrante]
    in not (valor `elem` valoresNoMesmoQuadrante)

-- Função para inserir um valor em uma célula
insereLista :: [(Int, (Int, Int))] -> Int -> Int -> Int -> [(Int, (Int, Int))]
insereLista listaIntPosi valor linha coluna = map (\(val, (x, y)) -> if x == linha && y == coluna then (valor, (x, y)) else (val, (x, y))) listaIntPosi

-- Função para tentar valores de 1 a 9 em uma célula
testaValores :: Int -> (Int, Int) -> [(Int, (Int, Int))] -> [Int] -> Maybe [(Int, (Int, Int))]
testaValores _ _ _ [] = Nothing
testaValores val (x, y) listaIntPosi (v:vs) =
    if testaConLinha listaIntPosi v x &&
       testaConColuna listaIntPosi v y &&
       testaConQuadrante listaIntPosi v x y
    then
        case resolveSudoku (insereLista listaIntPosi v x y) of
            Just solucao -> Just solucao
            Nothing -> testaValores val (x, y) listaIntPosi vs
    else
        testaValores val (x, y) listaIntPosi vs

-- Função recursiva que tenta preencher cada célula vazia do tabuleiro com valores de 1 a 9 (adaptação de uma função gerada com a ajuda do Chat GPT (https://chat.openai.com/))
resolveSudoku :: [(Int, (Int, Int))] -> Maybe [(Int, (Int, Int))]
resolveSudoku listaIntPosi =
    case achaProx0 listaIntPosi of
        Nothing -> Just listaIntPosi
        Just (val, (x, y)) -> testaValores val (x, y) listaIntPosi [1..9]

main :: IO ()
main = do
    let nomeArq = "tabuleiro.txt"
    conteudo <- leArq nomeArq
    let intList = transformaInt conteudo
    let listaIntPosi = criaTuplas intList
    case resolveSudoku listaIntPosi of
        Just novaLista -> do
            putStrLn "Solução:"
            putStrLn (escreveLista novaLista)
        Nothing -> putStrLn "Não foi possível encontrar uma solução válida."
