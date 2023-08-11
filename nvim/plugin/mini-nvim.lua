local ok, mini_pairs = pcall(require, "mini.pairs")
if not ok then
	return
end

mini_pairs.setup()
