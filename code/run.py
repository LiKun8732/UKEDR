from recbole.quick_start import run_recbole


import argparse

parser = argparse.ArgumentParser(description='Set some superparameters')
parser.add_argument('--data_path', type=str, help='atom file path')
parser.add_argument('--emb',type=int,default=512,help='embeeding_size')
parser.add_argument('--batch_size',type=int,default=512)
parser.add_argument('--dataset',type=str)
args = parser.parse_args()

parameter_dict = {
   'data_path': args.data_path,

   'load_col':{
            'inter': ['user_id', 'item_id',  'rating'],
            'item':['item_id','item_emb'],
            'user':['user_id','user_emb'],
   },
   'embedding_size': args.emb,
   'benchmark_filename': ['train', 'test','valid'], #
   'epochs': 5000,
   'train_batch_size': args.batch_size, # 4096
   'eval_batch_size': args.batch_size, # 4096
   'metrics': ['AUC', 'AUPR','MAE', 'RMSE', 'LogLoss'],
   'LABEL_FIELD' : 'rating',
   }

run_recbole(model='AFM',dataset= args.dataset,config_dict=parameter_dict)
