let g:deoplete#enable_at_startup = 1

call deoplete#custom#option('sources', {
			\ '_': ['ale', 'tabnine', 'around', 'buffer', 'file', 'member', 'omni'],
			\ })
