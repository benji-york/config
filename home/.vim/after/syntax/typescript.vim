" Vim's built-in typescript typing doesn't parse type parameters very well.
" In particular code like...
"    for(let i=0; i<workerCount; i++) {
"      const workerId = `${i}`;
"      if(childProcessMgr.getWorkerProcess(workerId) != null)
" ...will result in all following code being completely unhilighted.
syntax clear typescriptTypeArguments
